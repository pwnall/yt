module Yt
  module Associations
    # Associations are a set of macro-like class methods to express
    # relationship between YouTube resources like "Channel has many Videos" or
    # "Account has one Id". They are inspired by ActiveRecord::Associations.
    module HasMany
      # @example Adds the +videos+ method to the Channel resource.
      #   class Channel < Resource
      #     has_many :videos
      #   end
      def has_many(attributes)
        require 'active_support' # does not load anything by default
        require 'active_support/core_ext/string/inflections' # for camelize ...
        require "yt/collections/#{attributes}"

        collection_name = attributes.to_s.sub(/.*\./, '').camelize.pluralize
        collection = "Yt::Collections::#{collection_name}".constantize
        define_memoized_method(attributes) { collection.of self }
      end

    private

      # A wrapper around Ruby’s +define_method+ that, in addition to adding an
      # instance method called +name+, adds an instance variable called +@name+
      # that stores the result of +name+ the first time is invoked, and returns
      # it every other time. Especially useful if invoking +name+ takes a long
      # time.
      def define_memoized_method(name, &method)
        define_method name do
          ivar = instance_variable_get "@#{name}"
          instance_variable_set "@#{name}", ivar || instance_eval(&method)
        end
      end
    end
  end
end