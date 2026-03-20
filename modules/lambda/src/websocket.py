import os
import boto3
import json

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['TABLE_NAME'])

def lambda_handler(event, context):
    route = event['requestContext'].get('routeKey')
    connection_id = event['requestContext']['connectionId']

    if route == '$connect':
        table.put_item(Item={'connectionId': connection_id})
        return {'statusCode': 200}

    elif route == '$disconnect':
        table.delete_item(Key={'connectionId': connection_id})
        return {'statusCode': 200}

    else:  # $default
        domain_name = event['requestContext']['domainName']
        stage = event['requestContext']['stage']
        endpoint_url = f"https://{domain_name}/{stage}"
        apigw = boto3.client('apigatewaymanagementapi', endpoint_url=endpoint_url)
        body = json.loads(event.get('body', '{}'))
        message = body.get('message', '')
        response = table.scan()
        connections = response.get('Items', [])
        for conn in connections:
            try:
                apigw.post_to_connection(ConnectionId=conn['connectionId'], Data=message.encode('utf-8'))
            except Exception as e:
                print(f"Error sending to {conn['connectionId']}: {e}")
        return {'statusCode': 200}
