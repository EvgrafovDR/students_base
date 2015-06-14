class RequestsController < ApplicationController

  layout false, :except => :fields

  def fields
    @fields=Field.all.order(:table_name)
    @relations=Reltable.all();
  end

  def sqlexec

    # для пущей безопасности проверим корректность запроса
    # принимаем только ajax-запросы
    error=false
    unless request.xhr?
      #head :bad_request
      error=true
    #  return
    end
    @sql=params[:sql]
    # какие-то действия с данными формы, проверки


    # возможно отобразить ту же форму - используем _form.html.erb,
    # т.к. на странице изменился только этот блок, например,
    # в случае ошибки, но с выводом сообщения об ошибке
    if error
      render :partial => 'requests/result', locals: { error_message: 'Сообщение об ошибке' }
      return
    else
      # ...либо просто отобразить какой-то текст
      sql = ActiveRecord::Base.connection()
      @sqlres = sql.execute(params[:sql])
      @count = params[:count]
      @names = params[:names]
      render :partial => 'requests/table', locals: { sqlres: @sqlres, count: @count, names: @names }
    end

  end

end
