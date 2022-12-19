  require 'google/apis/youtube_v3'
  require 'active_support/all'

  class SearchesController < ApplicationController
  GOOGLE_API_KEY = "AIzaSyBUsCWjX4xx51cN810jaw2G65VFNx7MaHo"

  def index
		@rank = "ブロンズ"
    if @search_query = params[:rsearch_query_01] then
      @search_query = "射線管理"
      binding.pry
      @keyword = "APEX" + @rank + @search_query
      @youtube_data = find_videos(@keyword)
    elsif @search_query = params[:rsearch_query_02] then
      @search_query = "撃ち合い"
      @keyword = "APEX" + @rank + @search_query
      @youtube_data = find_videos(@keyword)
    elsif @search_query = params[:rsearch_query_03] then
      @search_query = "立ち回り"
      @keyword = "APEX" + @rank + @search_query
      @youtube_data = find_videos(@keyword)
    elsif @search_query = params[:rsearch_query_04] then
      @search_query = "コーチング動画"
      @keyword = "APEX" + @rank + @search_query
      @youtube_data = find_videos(@keyword)
    elsif @search_query = params[:rsearch_query_01] && params[:rsearch_query_02] then
      @search_query = "射線管理"
      @keyword = "APEX" + @rank + @search_query
      @youtube_data = find_videos(@keyword)
      @search_query = "撃ち合い"
      @keyword = "APEX" + @rank + @search_query
      @youtube_data = find_videos(@keyword)
    elsif @search_query = params[:rsearch_query_01] && params[:rsearch_query_02] && params[:rsearch_query_03] then
      @search_query = "射線管理"
      @keyword = "APEX" + @rank + @search_query
      @youtube_data = find_videos(@keyword)
      @search_query = "撃ち合い"
      @keyword = "APEX" + @rank + @search_query
      @youtube_data = find_videos(@keyword)
      @search_query = "立ち回り"
      @keyword = "APEX" + @rank + @search_query
      @youtube_data = find_videos(@keyword)
    elsif @search_query = params[:rsearch_query_01] && params[:rsearch_query_02] && params[:rsearch_query_03] params[:rsearch_query_04] then
      @search_query = "射線管理"
      @keyword = "APEX" + @rank + @search_query
      @youtube_data = find_videos(@keyword)
      @search_query = "撃ち合い"
      @keyword = "APEX" + @rank + @search_query
      @youtube_data = find_videos(@keyword)
      @search_query = "立ち回り"
      @keyword = "APEX" + @rank + @search_query
      @youtube_data = find_videos(@keyword)
      @search_query = "コーチング動画"
      @keyword = "APEX" + @rank + @search_query
      @youtube_data = find_videos(@keyword)
    elsif @search_query = params[:rsearch_query_02] && params[:rsearch_query_03] then
      
    elsif @search_query = params[:rsearch_query_02] && params[:rsearch_query_04] then
    
    elsif @search_query = params[:rsearch_query_01 && params[:rsearch_query_03] && params[:rsearch_query_04] then
      
    elsif @search_query = params[:rsearch_query_04] && params[:rsearch_query_01] then
    else
    end
  end

	private
	def find_videos(keyword, after: 1.months.ago, before: Time.now) #検索キーワードと検索範囲を変えれるように引数に値を取っています
		service = Google::Apis::YoutubeV3::YouTubeService.new
		service.key = GOOGLE_API_KEY
		next_page_token = nil
		opt = {
			q: keyword,
			type: 'video',
			max_results: 2,
			order: :date,
			page_token: next_page_token
		}
		results = service.list_searches(:snippet, **opt)
		results.items.each do |item|
			id = item.id
			snippet = item.snippet
			puts "\"#{snippet.title}\" by #{snippet.channel_title} (id: #{id.video_id}) (#{snippet.published_at})"
		end
	end
end

