class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
    end

    redirect_to login_path, notice: 'If an account with that email exists, you will receive an email to reset your password'
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to login_path, alert: 'Your token has expired'
  end

  def update
    @user = User.find_signed!(params[:token], purpose: 'password_reset')

    if @user.update(password_params)
      redirect_to login_path, notice: 'Your password was reset successfully'
    else
      render :edit, status: :bad_request
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
