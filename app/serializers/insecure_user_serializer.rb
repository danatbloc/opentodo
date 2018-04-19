class InsecureUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :name

  def name
    object.first_name
  end
end
