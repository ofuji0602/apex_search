class KeywordsController < ApplicationController
  def index
    case (@keyword = params[:keyword])
    when ("beginner") then
      @keyword = "初心者向け"
    when ("setting") then
      @keyword = "設定方法"
    when ("character") then
      @keyword = "キャラ別"
    when ("recoil_control") then
      @keyword = "リコイル制御"
    when ("map_knowledge") then
      @keyword = "マップ知識"
    when ("characon") then
      @keyword = "キャラコン"
    else
      #(値1~3のいずれにも合致しなかった場合に実行する処理)
    end
  end
end
