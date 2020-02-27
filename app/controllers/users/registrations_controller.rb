# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:performance]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  def performance
    @skills = Skill.all
    @user = User.new(sign_up_params)
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    # @user = User.new(session["devise.regist_data"]["user"])
    # unless @user.valid?
    #   flash.now[:alert] = @user.errors.full_messages
    #   render :new and return
    # end
  end

  def done
    session["devise.regist_data"]["user"]["prefecture"] = params[:user][:prefecture]
    session["devise.regist_data"]["user"]["introduction"] = params[:user][:introduction]
    session["devise.regist_data"]["user"]["performance"] = params[:user][:performance]
    session["devise.regist_data"]["user"]["portfolio"] = params[:user][:portfolio]
    @user = User.new(session["devise.regist_data"]["user"])
    @skill_ids = params[:user][:skill_ids]
    @user.save!
    sign_in(:user, @user)

    @skill_ids.each do |skill_id|
      @tag = Tag.new(skill_id: skill_id, user_id: current_user.id)
      @tag.save!
    end
  end



  def edit_user
    @user = User.find_by(id: current_user.id)
    @skills = Skill.all
  end

  def update_user
    @user = User.find_by(id: current_user.id)
    @user.update!(user_params)
    
    @old_tags = Tag.where(user_id: current_user.id)
    @skill_ids = params[:user][:skill_ids]

    if @skill_ids.blank?
      @old_tags.destroy_all
    end
  end



  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end


  private
  def user_params
    params.require(:user).permit(:name, :name_kana, :email, :tel, :birthday, :status, :prefecture, :introduction, :performance, :portfolio, skill_ids: [])
  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

