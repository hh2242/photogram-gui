class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def detail
    id = params[:id]
    @photo = Photo.where(id: id).first
  end

  def insert_photo_record
    image = params[:input_image]
    caption = params[:input_caption]
    owner_id = params[:input_owner_id]

    @photo = Photo.new
    @photo.image = image
    @photo.caption = caption
    @photo.owner_id = owner_id

    if @photo.save
      redirect_to("/photos/" + @photo.id.to_s)
    else
      render :new
    end
  end

  def update_photo
    id = params[:id]
    image = params[:input_image]
    caption = params[:input_caption]

    @photo = Photo.where(id: id).first
    @photo.image = image
    @photo.caption = caption

    if @photo.save
      redirect_to("/photos/" + id)
    else
      render :new
    end
  end

  def delete_photo
    id = params[:id]
    @photo = Photo.where(id: id).first
    if @photo.destroy
      redirect_to("/photos")
    else
      render :new
    end
  end

  def add_comment
    photo_id = params[:input_photo_id]
    author_id = params[:input_author_id]
    body = params[:input_comment]

    @comment = Comment.new
    @comment.photo_id = photo_id
    @comment.author_id = author_id
    @comment.body = body

    if @comment.save
      redirect_to("/photos/" + photo_id)
    else
      render :new
    end
  end
end
