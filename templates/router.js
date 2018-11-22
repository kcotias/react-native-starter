import { createStackNavigator } from 'react-navigation';
import {
    HomeScreen
} from './screens';

const Router = createStackNavigator({
    HOME: { screen: HomeScreen }
});

export default Router;
