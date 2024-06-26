import React, { createContext, useReducer } from "react";

export const Global = createContext();

export const GlobalProvider = ({ children }) => {
  const reduce = (prev, next) => ({ ...prev, ...next });
  const [user, setUser] = useReducer(reduce, {});

  return (
    <Global.Provider value={{ user, setUser }}> {children} </Global.Provider>
  );
};
