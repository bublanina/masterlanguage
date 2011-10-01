# -*- encoding : utf-8 -*-
  def test_index
    get :index
    assert_template 'index'
  end
