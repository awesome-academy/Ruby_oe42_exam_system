class SessionsController < Devise::SessionsController
  def new
    @referer_url = root_path
    super
  end

  def create
    @referer_url = root_path
    super
  end

  def destroy
    @referer_url = root_path
    super
  end
end
