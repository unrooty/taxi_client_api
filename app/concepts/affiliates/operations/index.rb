# frozen_string_literal: true

class Affiliate::Index < Trailblazer::Operation
  step :model!

  private

  def model!(options, *)
    options[:model] = Affiliate.all
  end
end
