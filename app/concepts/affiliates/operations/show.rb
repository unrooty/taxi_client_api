# frozen_string_literal: true

class Affiliate::Show < Trailblazer::Operation
  step Model(Affiliate, :[])
end
