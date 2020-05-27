import { NativeModules } from 'react-native';

type SvipeAuthType = {
  multiply(a: number, b: number): Promise<number>;
};

const { SvipeAuth } = NativeModules;

export default SvipeAuth as SvipeAuthType;
