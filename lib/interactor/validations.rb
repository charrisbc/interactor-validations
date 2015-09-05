require 'interactor/validations/version'
##
# Allows usage of ActiveModel::Validations on Interactors.
#
# Interactor::Validations allows the use of any ActiveModel::Validations in an interactor
# that includes it by doing three basic things:
#  - Automatically includes ActiveModel::Validations
#  - Sets up a before block in the interactor to call self.valid? and if false, fails the context with the
#    validation errors as the context's error.
#  - Delegates any validations to self.context rather than self.
#
# @example
# This is a sample interactor that is validating the presence of a few variables, aaa and bbb.
# 
# module Test
#   class Tester
#     include Interactor
#     include Interactor::Validations
# 
#     validates_presence_of :aaa, :bbb
# 
#     def call
#       puts "in CALL"
#     end
#   end
# end
#
# Failing call: Test::Tester.call(blah: 123)
# Successful call: Test::Tester.call(aaa: "aaahhhh!", bbb: "alsjflajf")
# 
#
module Interactor
  module Validations
    extend ::ActiveSupport::Concern

    included do
      include ::ActiveModel::Validations

      before do
        unless self.valid?
          self.context.fail!(error: self.errors.full_messages.to_sentence)
        end
      end

      def read_attribute_for_validation(key)
        self.context.send(key.to_sym)
      end
    end
  end
end
