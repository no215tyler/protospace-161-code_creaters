class PrototypesController < ApplicationController
  def index

  end

  def new

    @prototype = Prototype.new

  end

  #画像の保存を許可するストロングパラメーター未入力

end
