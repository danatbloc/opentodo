class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :private, :date

  def date
    object.created_at.strftime('%B %d, %Y')
  end
end
