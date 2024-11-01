import requests
import json

# Define the base URL
api_url_to_aws_s3_bucket = "http://localhost:5247/api/v1"

API_KEY = "cJGZ8L1sDcPezjOy1zacPJZxzZxrPObm2Ggs1U0V+fE=SECURE"  # Replace with your actual API key
headers = {"X-API-Key": API_KEY, "Content-Type": "application/json"}

# Register a new user and log in to get a JWT token
def get_jwt_token():
    # User registration (assuming it doesn't need authentication)
    register_url = f"{api_url_to_aws_s3_bucket}/register"
    register_data = json.dumps({"username": "James Howlett", "password": "securepassword"})
    register_response = requests.post(register_url, headers=headers, data=register_data)
    print("Register User:", register_response.status_code, register_response.json())
    
    # User login
    login_url = f"{api_url_to_aws_s3_bucket}/login"
    login_data = json.dumps({"username": "James Howlett", "password": "securepassword"})
    login_response = requests.post(login_url, headers=headers, data=login_data)
    print("Login User:", login_response.status_code, login_response.json())
    
    # Extracting JWT token from login response
    jwt_token = login_response.json().get('token')
    return jwt_token

# Create a new terraform_module
def test_create_terraform_module(jwt_token):
    url = f"{api_enpoint_to_aws_s3_bucket}/terraform_module"
    auth_headers = {**headers, "Authorization": f"Bearer {jwt_token}"}
    data = json.dumps({"author": "Lois Lane", "title": "New terraform_module Title"})
    response = requests.post(url, headers=auth_headers, data=data)
    print("Create terraform_module:", response.status_code, response.json())
    return response.json()

# Get all terraform_module
def test_get_terraform_module(jwt_token):
    url = f"{api_url_to_aws_s3_bucket}/terraform_module"
    auth_headers = {**headers, "Authorization": f"Bearer {jwt_token}"}
    response = requests.get(url, headers=auth_headers)
    print("Get terraform_module:", response.status_code, response.json())

# Get a specific terraform_module by ID
def test_get_terraform_module(terraform_module_id, jwt_token):
    url = f"{api_url_to_aws_s3_bucket}/terraform_module/{terraform_module_id}"
    auth_headers = {**headers, "Authorization": f"Bearer {jwt_token}"}
    response = requests.get(url, headers=auth_headers)
    print("Get terraform_module:", response.status_code, response.json())

# Update a terraform_module
def test_update_terraform_module(terraform_module_id, jwt_token):
    url = f"{api_url_to_aws_s3_bucket}/terraform_module/{terraform_module_id}"
    auth_headers = {**headers, "Authorization": f"Bearer {jwt_token}"}
    data = json.dumps({"author": "John Smith", "title": "Updated terraform_module Title"})
    response = requests.put(url, headers=auth_headers, data=data)
    print("Update terraform_module:", response.status_code, response.json())

# Delete a terraform_module
def test_delete_terraform_module(terraform_module_id, jwt_token):
    url = f"{api_url_to_aws_s3_bucket}/terraform_module/{terraform_module_id}"
    auth_headers = {**headers, "Authorization": f"Bearer {jwt_token}"}
    response = requests.delete(url, headers=auth_headers)
    print("Delete terraform_module:", response.status_code)

# Run tests
def run_tests():
    # Authenticate and obtain JWT
    jwt_token = get_jwt_token()
    if jwt_token:
        # Create a terraform_module and use its ID for further tests
        terraform_module = test_create_terraform_module(jwt_token)
        terraform_module_id = terraform_module['data']['id']

        # Perform operations
        test_get_terraform_module(jwt_token)
        test_get_terraform_module(terraform_module_id, jwt_token)
        test_update_terraform_module(terraform_module_id, jwt_token)
        test_delete_terraform_module(terraform_module_id, jwt_token)

if __name__ == "__main__":
    run_tests()
