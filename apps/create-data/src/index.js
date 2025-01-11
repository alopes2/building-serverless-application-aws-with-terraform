import { DocumentDBClient } from '@aws-sdk/client-dynamodb';
import { DocumentDBDocumentClient, PutCommand } from '@aws-sdk/lib-dynamodb';
import { randomUUID } from 'crypto';

const tableName = process.env.TABLE_NAME;

const client = new DocumentDBClient({});
const docClient = DocumentDBDocumentClient.from(client);

export const handler = async (event) => {
  let body;

  try {
    body = JSON.parse(event.body);
  } catch {
    return {
      statusCode: 500,
      body: 'Body missing/wrong',
    };
  }

  if (!body?.data) {
    return {
      statusCode: 400,
    };
  }

  console.log('Received body ', body);

  const data = {
    ID: randomUUID(),
    Data: body.data,
  };

  const command = new PutCommand({
    TableName: tableName,
    Item: data,
  });

  try {
    await docClient.send(command);

    return {
      statusCode: 200,
      body: JSON.stringify(data),
    };
  } catch {
    return {
      statusCode: 500,
    };
  }
};