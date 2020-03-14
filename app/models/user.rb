# frozen_string_literal: true

class User < ApplicationRecord
  has_many :nurses
  has_many :patients
  has_many :access_tokens
  has_many :chat_messages

  validates :name, presence: true

end
