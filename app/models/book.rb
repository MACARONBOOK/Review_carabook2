class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  scope :latest, -> {order(created_at: :desc)}  # order→データの呼び出し, created_at→投稿日, desc→昇順
  scope :old, -> {order(created_at: :asc)}      # asc→降順
  scope :star_count, -> {order(star: :desc)}    # scopeの後ろは、BookConのActionに記述

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Book.where(title: content)
    elsif method == 'forward'
      Book.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Book.where('title LIKE ?', '%'+content)
    else
      Book.where('title LIKE ?', '%'+content+'%')
    end
  end
end
