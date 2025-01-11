import { DynamoDBClient } from '@aws-sdk/client-dynamodb';
import { DynamoDBDocumentClient, GetCommand } from '@aws-sdk/lib-dynamodb';

const tableName = process.env.TABLE_NAME;

const client = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {
  const id = event?.pathParameters?.ID;
  if (!id) {
    return {
      statusCode: 400,
      body: JSON.stringify({
        message: 'ID missing',
      }),
    };
  }

  console.log('Getting data for movie');

  const command = new GetCommand({
    TableName: tableName,
    Key: {
      ID: id,
    },
  });

  try {
    const dynamodbResponse = await docClient.send(command);

    if (!dynamodbResponse?.Item) {
      return {
        statusCode: 404,
        body: JSON.stringify({ message: 'Data not found' }),
      };
    }

    const responseData = {
      id: dynamodbResponse.Item.ID,
      data: dynamodbResponse.Item.Data,
    };

    return {
      statusCode: 200,
      body: JSON.stringify(responseData),
    };
  } catch (error) {
    console.error('Got error', error);
    return {
      statusCode: 500,
      body: JSON.stringify({
        message: 'Got error calling DynamoDB',
        errorMessage: error.message,
      }),
    };
  }
};
