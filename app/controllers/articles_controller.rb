
class ArticlesController < ApplicationController
  before_action :set_author
  before_action :set_article, only: [:show, :edit, :update, :destroy]
 
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.where(tenant_id: @author.id)
  end

  def generate_referral_code
    charset = Array('A'..'Z') + Array('a'..'z') + Array('0'..'9')
    referral_code = Array.new(10) { charset.sample }.join
    referral_code
  end

  def performance
    user.comments
  end


  def fsfd
    # get only published trading accounts for investor from this partner [X-API-PARTNER]
    account_model = TradingAccountView
    account_model = account_model.where.not(group: Configs::Group.get_groups) if true?(params_index[:is_system])
    account_model = account_model.searchable_statuses unless true?(params_index[:is_system]) && User.is_vip?
    account_model = account_model.or(TradingAccountView.in_direct)
    account_model = account_model.includes(:partner_user, :partner_relationship, :trading_account_type)
    search_params = [:name, :username, :mt4_account_id]
    options       = params_index.merge({search_with_like: search_params})
    objects       = account_model.ranking_direction(ranking_direction).fetch_page(options)
    render json: json_with_pagination(data: objects, options: { ranking_direction: ranking_direction, include_trading_investment_config: true, include_mt4_account_id: true })
  end
 
  private
    def set_article
      @article = Article.find_by!(id: params[:id], tenant_id: @author.id)
    end
 
    def set_author
      @author = Author.find_by!(slug: request.subdomain)
    end
 end
 