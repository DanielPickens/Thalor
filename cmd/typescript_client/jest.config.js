module.exports = {
  testEnvironment: 'node',
  testRegex: '(/__tests__/.*|(\\.|/)(test|spec))\\.ts$',
  testPathIgnorePatterns: [
    '/node_modules/',
    '/dist/',
    '/ThalorLocal/',
    '/distWeb/',
    '/distLambda/',
    '.d.ts',
    '<rootDir>/dist/',
  ],
  transform: {
    '^.+\\.(t|j)sx?$': '@swc/jest',
  },
  coverageThreshold: {
    global: {
      branches: 90,
      functions: 90,
      lines: 90,
      statements: 90,
    },
  },
};
