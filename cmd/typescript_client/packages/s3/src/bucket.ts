import {
  connect as templateConnect,
  getBucketName as templateGetBucketName,
  getSignedUrlS3 as templateGetSignedUrl,
} from '@Thalor/template-s3';

import { S3Client } from '@aws-sdk/client-s3';

import { MetadataBearer, RequestPresigningArguments } from '@smithy/types';
import { Client, Command } from '@smithy/smithy-client';

import ThalorConfig from '../Thalor.json';
import ThalorSchema from '../schemas/package.schema.json';

export const connect = async (deploymentName?: string): Promise<S3Client> => {
  return await templateConnect(
    ThalorConfig,
    ThalorSchema,
    deploymentName
  );
};

export const getSignedUrl = async <
  InputTypesUnion extends object,
  InputType extends InputTypesUnion,
  OutputType extends MetadataBearer = MetadataBearer
>(
  client: Client<any, InputTypesUnion, MetadataBearer, any>,
  command: Command<InputType, OutputType, any, InputTypesUnion, MetadataBearer>,
  options: RequestPresigningArguments = {}
): Promise<string> => {
  return templateGetSignedUrl(client, command, options);
};

export const getBucketName = async (
  deploymentName?: string
): Promise<string> => {
  return await templateGetBucketName(
    ThalorConfig,
    ThalorSchema,
    deploymentName
  );
};
