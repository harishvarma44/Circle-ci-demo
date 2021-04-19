import React from 'react';
import { shallow } from 'enzyme';
import { render } from '@testing-library/react';
import Enzyme from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

import App from './App';

Enzyme.configure({ adapter: new Adapter() });

test('renders learn react link', () => {
  const { getByText } = render(<App />);
  const linkElement = getByText(/welcome/i);
  expect(linkElement).toBeInTheDocument();
});

it('expect to render page', () => {
  expect(shallow(<App />)).toMatchSnapshot();
})
