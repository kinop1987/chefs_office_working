require 'rails_helper'

RSpec.describe Supplier, type: :model do
  before do 
    @supplier = build(:supplier)
  end

  describe 'バリデーション' do
    it 'name, email, telephone, website, password, picがあればOK' do
      expect(@supplier.valid?).to eq(false)
    end

    it 'nameが空だとNG' do
      @supplier.name = ''
      expect(@supplier.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      @supplier.email = ''
      expect(@supplier.valid?).to eq(false)
    end

    it 'telephoneが空だとNG' do
      @supplier.telephone = ''
      expect(@supplier.valid?).to eq(false)
    end

     it 'websiteが空だとNG' do
       @supplier.website = ''
       expect(@supplier.valid?).to eq(false)
     end

     it 'passwordが空だとNG' do
       @supplier.password = ''
       expect(@supplier.valid?).to eq(false)
     end

     it 'picが空だとNG' do
       @supplier.pic = ''
       expect(@supplier.valid?).to eq(false)
     end
    end
  end