require 'test_helper'

class AutosControllerTest < ActionController::TestCase
    setup do
    	@auto_hash = FactoryGirl.attributes_for(:auto)
    end

    test "should create auto" do
    	assert_difference('Auto.count', 1) do
    		post :create, auto: @auto_hash
    	end
    	assert_response :redirect
    	assert_redirected_to auto_path(assigns(:auto))
    end
    test "should destroy auto" do
    	new_car = FactoryGirl.create :auto
    	assert_difference('Auto.count', -1) do
    		delete :destroy, id: new_car.id
    	end
    	assert_response :redirect
    	assert_redirected_to autos_path
    end

    test 'should display autos index' do
        get :index
        assert_response :success
        assert_template :index
        assert_equal Auto.count, assigns(:autos).count
    end

    test 'should display auto edit' do
    	new_auto = FactoryGirl.create :auto
        get :edit, id: new_auto.id
        assert_equal new_auto, assigns(:auto)
        assert_response :success
        assert_template :edit
    end

    test 'should update auto' do
        new_auto = FactoryGirl.create :auto
        patch :update , id: new_auto.id , auto: {model: 'A8'}
        assert_response :redirect
        assert_redirected_to auto_path(assigns(:auto))
        updated_auto = Auto.find(new_auto.id)
        assert_equal 'A8', updated_auto.model
    end

end
