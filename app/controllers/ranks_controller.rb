  class RanksController < ApplicationController

  def index
    case (@rank = params[:rank])
    when ("bronz") then
      @rank = "ブロンズ"
    when ("silver") then
      @rank = "シルバー"
    when ("gold") then
      @rank = "ゴールド"
    when ("platinum") then
      @rank = "プラチナ"
    when ("diamond") then
      @rank = "ダイアモンド"
    when ("master") then
      @rank = "マスター"
    else
      #(値1~3のいずれにも合致しなかった場合に実行する処理)
    end
  end
end