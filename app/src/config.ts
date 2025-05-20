if(!process.env.MONGO_URI) {
  throw new Error("MongoDB connection string not set");
}

const config: {
  MONGO_URI: string
  PORT: number
} = {
  MONGO_URI: process.env.MONGO_URI,
  PORT: +(process.env.PORT || 3000),
}

export default config
