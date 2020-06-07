import { NativeModules } from 'react-native';

type SvipeAuthType = {
  scanDocument(challenge: number): Promise<object>;
};

const { SvipeAuth } = NativeModules;

export default SvipeAuth as SvipeAuthType;
