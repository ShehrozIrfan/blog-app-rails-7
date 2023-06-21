class BlogPost < ApplicationRecord
  has_rich_text :content
  has_one_attached :cover_image

  validates :title, presence: true
  validates :content, presence: true

  # scope :sorted, -> {order(Arel.sql("published_at desc nulls last"), updated_at: :desc)}
  scope :sorted, -> {order(arel_table[:published_at].desc.nulls_last, updated_at: :desc)}
  scope :draft, -> {where(published_at: nil)}
  scope :published, -> {where('published_at <= ?', Time.current)}
  scope :scheduled, -> {where('published_at > ?', Time.current)}

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end
end
