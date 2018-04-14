# frozen_string_literal: true

Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  # Account mutations

  field :register_account, function: Resolvers::Accounts::Register.new

  field :confirm_email, function: Resolvers::Accounts::ConfirmEmail.new

  field :send_activation_email,
        function: Resolvers::Accounts::EmailSender::Activation.new

  field :send_reset_password_email,
        function: Resolvers::Accounts::EmailSender::ResetPassword.new

  field :reset_password, function: Resolvers::Accounts::ResetPassword.new

  field :login, function: Resolvers::Accounts::Login.new

  field :update_account, function: Resolvers::Accounts::Update.new

  field :refresh_token, function: Resolvers::Accounts::RefreshToken.new

  field :activate_account, function: Resolvers::Accounts::Activate.new

  # Order mutations
  field :create_order, function: Resolvers::Orders::Create.new
  field :update_order, function: Resolvers::Orders::Update.new
  field :delete_order, function: Resolvers::Orders::Delete.new

  # Feedback
  field :send_feedback, function: Resolvers::Feedbacks::Send.new
end
