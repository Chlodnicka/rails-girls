class EntriesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @entries = Entry.page params[:page]
  end

  def show
    @entry = Entry.find(params['id'])
  end

  def new
  end

  def create
    entry_params = params.require('entry').permit('title', 'contents')
    Entry.transaction do
      entry = Entry.create(entry_params)
      entry.users << current_user
      flash.notice = 'Entry created succesfully'
      redirect_to(entry_path(entry))
    end
  end

  def edit
    @entry = Entry.find(params['id'])
  end

  def update
    entry_params = params['entry'].permit('title', 'contents')
    Entry.transaction do
      entry = Entry.find(params['id'])
      entry.update(entry_params)
      entry.users << current_user unless entry.users.include? current_user
      flash.notice = 'Entry updated successfully'
      redirect_to(entry_path(entry))
    end
  end

  def destroy
    @entry = Entry.find(params['id'])
    @entry.destroy
    flash.notice = 'Entry destroyed ;('
    redirect_to(entries_path)
  end
end
