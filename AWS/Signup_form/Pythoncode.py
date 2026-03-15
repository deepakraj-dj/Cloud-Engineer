import json

def lambda_handler(event, context):
    print("EVENT:", event)

    try:
        # API Gateway (HTTP API) passes the request body as a string
        body = event.get("body", "{}")
        data = json.loads(body)  # parse JSON string into Python dict

        username = data.get("username")
        password = data.get("password")

        if username == "Deepak" and password == "2316":
            return {
                "statusCode": 200,
                "headers": {
                    "Content-Type": "application/json",
                    "Access-Control-Allow-Origin": "*"  # allow CORS
                },
                "body": json.dumps({"message": "login successful"})
            }
        else:
            return {
                "statusCode": 401,
                "headers": {
                    "Content-Type": "application/json",
                    "Access-Control-Allow-Origin": "*"
                },
                "body": json.dumps({"message": "Invalid Credentials"})
            }

    except Exception as e:
        print("ERROR:", str(e))
        return {
            "statusCode": 500,
            "headers": {
                "Content-Type": "application/json",
                "Access-Control-Allow-Origin": "*"
            },
            "body": json.dumps({"error": str(e)})
        }
