class DocumentsController < ApplicationController
  before_action :set_document, except: [:index]

  def index
    @documents = Document.all
  end

  def show
  end

  private

  def set_document
    @document = Document.find(params[:id])
  end
end
