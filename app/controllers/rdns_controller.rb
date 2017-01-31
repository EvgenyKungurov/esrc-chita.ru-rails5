class RdnsController < ApplicationController
  before_action :validate_token

  def create
    @rdns = Domain.find_or_create_by(name: params[:domain])
    @rdns.update_attributes(ip: params[:ip])
    render json: { message: "success added ip - #{@rdns.ip} to #{@rdns.name}"}
  end

  def show
    ip = Domain.find_by(name: params[:id]).ip
    redirect_to "/domain/#{ip}" 
  end

  private

  def validate_token
    redirect_to root_path unless token == params[:token]
  end

  def token
    ENV['RDNS']
  end
end
