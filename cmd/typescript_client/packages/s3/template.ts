import { run } from '@Thalor/template-s3-cli';

run(process.argv).catch((e) => {
  console.log(e);
  process.exit(1);
});
