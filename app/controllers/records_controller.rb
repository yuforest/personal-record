class RecordsController < ApplicationController
  before_action :set_record, only:[:edit, :update, :destroy]
  def index

    @records = Record.all
  end
  def new
    if params[:back]
      @record = Record.new(record_params)
    else
      @record = Record.new
    end
  end
  def create
    @record = Record.create(record_params)
    if @record.save
      redirect_to records_path, notice: "記録を作成しました!"
    else
      render 'new'
    end
    
  end
  def edit
    
  end
  def update
    if @record.update(record_params)
      redirect_to records_path, notice: "記録を編集しました！"
    else
      render 'edit'
    end
  end
  def destroy
    @record.destroy
    redirect_to records_path, notice: "記録を削除しました"
  end
  def confirm
    @record = Record.new(record_params)
  end
  private
  def record_params
    params.require(:record).permit(:content)
  end
  
  def set_record
    @record = Record.find(params[:id])
  end
end
