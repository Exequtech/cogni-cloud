import express from 'express';
import mongoose from 'mongoose';
import config from './config.js';

const app = express();

mongoose.connect(config.MONGO_URI, {retryWrites: true}).then(() =>
  console.log('MongoDB connected!')
);

app.get('/', (req, res) => {
  res.status(200).send({ hello: "world" });
});

app.listen(config.PORT, () => {
  console.log(`Server is listening on http://localhost:${config.PORT}`);
});
