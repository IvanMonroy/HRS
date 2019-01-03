require 'swagger_helper'

describe 'Vehicles API' do
################## --CREATE -- #########################
  path '/api/vehicles' do
    post 'Create a vehicle' do
      tags 'Vehicles'
      consumes 'application/json'
      parameter name: :vehicle, in: :body, schema: {
          type: :object,
          properties:{
              plate:{ type: :string},
              brand:{ type: :string},
              year:{ type: :integer}
          },
          required: [ 'plate', 'brand', 'year']
      }
      response '204', 'NO CONTENT' do
        run_test!
      end
      response '201', 'vehicle created successfully' do
        run_test!
      end
    end
  end

  #####################3 --GET ONE VEHICLE-- ####################
  path '/api/vehicles/{id}' do
    get 'Find vehicles by id' do
      tags 'Vehicles'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string
      response '200', 'id found' do
      end
      response '404', 'Vehicle not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  ###################### --DELETE VEHICLE -- #################

  path '/api/vehicles/{id}' do
    delete 'Delete vehicles' do
      tags 'Vehicles'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string
      response '200', 'id found' do
      end
      response '404', 'Vehicle not found' do
        run_test!
      end
    end
  end
  ################ --UPDATE -- ################
  path '/api/vehicles/{id}' do

    put 'Update vehicle' do

      tags 'Vehicles'

      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :string
      parameter name: :vehicle, in: :body, schema: {
          type: :object,
          properties:{
              plate:{ type: :string},
              brand:{ type: :string},
              year:{ type: :integer}
          },
          required: [ 'plate', 'brand', 'year']
      }
      response '204', 'NO CONTENT' do
        run_test!
      end
      response '201', 'vehicle update successfully' do
        run_test!
      end

    end

  end
  ############# --INDEX -- #################333
  path '/api/vehicles/' do

    get 'index: Trae todas los vehículos registradas' do
      tags 'Vehicles'
      produces 'application/json'
      response '200', 'id found' do
        run_test!
      end
      response '404', 'Entrie not found' do
        run_test!
      end
    end
  end

end