class SystemCollectionSerializer < ActiveModel::Serializer
  attributes :id, :internal_name, :external_name, :type, :deleted
end
