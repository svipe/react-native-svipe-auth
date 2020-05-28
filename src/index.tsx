import { NativeModules } from 'react-native';

type SvipeAuthType = {
  scanDocument(challenge: number): Promise<number>;
};

const { SvipeAuth } = NativeModules;

export default SvipeAuth as SvipeAuthType;
