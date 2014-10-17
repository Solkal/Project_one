require 'test_helper'

class AutosControllerTest < ActionController::TestCase
setup do
	@auto = autos(:audi)
end

test "should create auto" do
	assert_difference('Auto.count', 1) do
	post :create, auto:{ make: @auto.make, model: @auto.model, year: @auto.year}
	end
	assert_redirected_to auto_path(assigns(:auto))
end
test "should destroy auto" do
	assert_difference('Auto.count', -1) do
		delete :destroy, id: @auto
	end

	assert_redirected_to autos_path
end

end
