import * as React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import SvipeAuth from 'react-native-svipe-auth';

export default function App() {
  const [result, setResult] = React.useState<object | undefined>();

  React.useEffect(() => {

    SvipeAuth.scanDocument(3).then(setResult);

  }, []);

  return (
    <View style={styles.container}>
      <Text>Result: {result}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
