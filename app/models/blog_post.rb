class BlogPost < ApplicationRecord
  has_rich_text :content

  validates :title, presence: true, length: { minimum: 3, maximum: 50 } 
  validates :content, presence: true, length: { minimum: 10, maximum: 200 }

  scope :sorted, -> { order(arel_table[:published_at].desc.nulls_first).order(updated_at: :desc) }
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at >  Time.current
  end
end