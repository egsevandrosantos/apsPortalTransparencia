require "#{Rails.root}/app/http/services/ufs.rb";
require "#{Rails.root}/app/http/services/limite_de_gastos.rb";

class LimiteGastosController < ApplicationController
  def index
    @ufs_array = Services::Ufs.get_ufs()
  end

  def generate_rel
    @ufs = params[:ufs].split(',')
    @gastos = @ufs.map { |uf| Services::LimiteDeGastos.get_limite_de_gastos(uf, '', '') }
    @gastos = @gastos.each_with_index.map { |gastos, index| [@ufs[index], gastos] }
    render json: @gastos, status: :ok
  end

  def generate_rel_by_uf
    @uf = params[:uf]
    @gastos = Services::LimiteDeGastos.get_limite_de_gastos(@uf, '', '')
    render json: @gastos, status: :ok
  end
end