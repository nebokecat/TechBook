# frozen_string_literal: true

require 'open-uri'
class User < ApplicationRecord
  # deviseモジュール設定
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:twitter]

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_books, through: :favorites, source: :book
  has_many :book_comments, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { maximum: 15, minimum: 3 }
  validates :introduction, length: { maximum: 200 }

  # フォローしている人達
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow

  # フォロワー
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy, inverse_of: :follow
  has_many :followers, through: :reverse_of_relationships, source: :user

  attachment :profile_image

  # OAuth

  def self.from_omniauth(auth)
    user = User.find_by(uid: auth.uid, provider: auth.provider)
    user ||= User.create(
      uid:            auth.uid,
      provider:       auth.provider,
      profile_image:  URI.parse(auth.info.image).open,
      email:          User.dummy_email(auth),
      name:           auth.info.name,
      password:       Devise.friendly_token[0, 20]
    )
    user
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes']) do |user|
        user.attributes = params
      end
    else
      super
    end
  end

  # follow

  def follow(other_user)
    self.relationships.find_or_create_by(follow_id: other_user.id) unless self == other_user
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship&.destroy
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
