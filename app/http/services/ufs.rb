require 'net/http'
require "json"

def get_ufs
  uri = URI('https://divulgacandcontas.tse.jus.br/divulga/rest/v1/eleicao/ufs')
  res = Net::HTTP.get_response(uri)

  case res
  when Net::HTTPOK
    puts "OK"
    return JSON.parse(res.body)
  else
    puts "ERROR"
    return JSON.parse([])
  end
end

#get_ufs()