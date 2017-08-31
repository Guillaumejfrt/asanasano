# frozen_string_literal: true
# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  state        :integer
#  slot_id      :integer
#  amount_cents :integer          default(0), not null
#  payment      :json
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  mangopay_id  :integer
#  user_id      :integer
#
# Indexes
#
#  index_orders_on_slot_id  (slot_id)
#  index_orders_on_user_id  (user_id)
#

class Order < ApplicationRecord
  monetize :amount_cents
  belongs_to :slot
  belongs_to :user

  enum state: %i(pending paid failed)
end
