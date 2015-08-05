# -*- coding: utf-8 -*-
require 'sixarm_ruby_xid_test'

describe XID do
  describe '#new' do
    describe 'with initialize defaults' do
      it 'is a string with the correct length and characters' do
        xid = XID.new
        xid.must_match /\A[0-9a-f]{32}\z/
      end

      it 'is always different' do
        seen = Set.new
        99_999.times.each do
          xid = XID.new
          seen.include?(xid).must_equal false
          seen.add(xid)
        end
      end
    end

    describe 'with valid initialize string' do
      it 'sets' do
        s = '1cf2a839c0890bb9be7e9d56b7405a54'
        xid = XID.new(s)
        xid.must_equal(s)
      end
    end

    describe 'with invalid initialize string' do
      it 'raises' do
        proc { XID.new('invalid') }.must_raise ArgumentError
      end
    end
  end

  describe '.valid' do
    describe 'with valid string' do
      it 'is true' do
        xid = XID.new('c3d010bbfec046f59c7fe843d32dab32')
        xid.valid?.must_equal true
      end
    end

    describe 'with invalid string' do
      it 'never gets called because it fails to create an xid' do
        proc { XID.new('abc') }.must_raise ArgumentError
      end
    end
  end

  describe '#valid' do
    describe 'with valid string' do
      it 'is true' do
        XID.valid?('c3d010bbfec046f59c7fe843d32dab32').must_be_same_as true
      end
    end

    describe 'with invalid string' do
      it 'is false' do
        XID.valid?('abc').must_be_same_as false
      end
    end
  end

  describe '#digest' do
    it 'digests' do
      xid = XID.new
      xid.digest.must_match /\A[0-9a-f]{64}\z/
    end
  end

  describe '.digest' do
    it 'digests' do
      XID.digest('foo').must_match /\A[0-9a-f]{64}\z/
    end
  end

  describe '.parse' do
    it 'converts to lower case' do
      XID.parse('C3D010BBFEC046F59C7FE843D32DAB32').must_equal 'c3d010bbfec046f59c7fe843d32dab32'
    end

    it 'deletes non-hex characters' do
      XID.parse('!!c3d010bb-fec0-46f59c7f-e843d32dab32!!').must_equal 'c3d010bbfec046f59c7fe843d32dab32'
    end

    it 'chops at 32 characters' do
      XID.parse('c3d010bbfec046f59c7fe843d32dab32aaaaaaaaa').must_equal 'c3d010bbfec046f59c7fe843d32dab32'
    end

    it 'raises if the string is invalid' do
      proc { XID.parse('abc') }.must_raise ArgumentError
    end
  end
end
