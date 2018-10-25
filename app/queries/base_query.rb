class BaseQuery
	include QueryParamsHelper

  def perform!
    { 
    	result: result_query.page(page).per(per_page), 
    	count: result_query.count 
    }
  end

  private

  def result_query
  	raise NotImplementedError, 'For subclasses only!'
  end
end