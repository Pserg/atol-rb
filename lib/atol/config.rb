# frozen_string_literal: true

require 'anyway'
require 'net/http'
require 'atol/version'

module Atol
  class Config < Anyway::Config
    attr_config :login,
                :password,
                :inn,
                :group_code,
                :payment_address,
                :default_sno,
                :default_tax,
                :callback_url,
                :company_email,
                req_tries_number: 3,
                default_payment_type: 1,
                http_client: Net::HTTP,
                api_url: "https://online.atol.ru/possystem/#{Atol::Version::API}"
  end
end
